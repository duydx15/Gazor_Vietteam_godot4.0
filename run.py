from pathlib import Path
import sys
import os
import cv2


CURRENT_PATH=os.path.dirname(os.path.abspath(__file__))
print(CURRENT_PATH)
sys.path.append(CURRENT_PATH)
sys.path.append(os.path.join(CURRENT_PATH,"whisper"))
sys.path.append(os.path.join(CURRENT_PATH,"BertGoEmotion"))
# sys.path.append(os.path.join(CURRENT_PATH,"BertGoEmotion","GenEmotionText"))
import torch
from moviepy.editor import VideoFileClip,concatenate_videoclips,TextClip,CompositeVideoClip

import cv2
import moviepy.editor as mp
import subprocess
from natsort import natsorted
import whisper

from pydub import AudioSegment
from GenEmotionText import loadModel,genEmotion
# import loadModel,genEmotion
import shutil
import glob
import argparse
import timeit
import PIL.Image
def getEmotion(text,model_bert):
    return  genEmotion(text,model_bert).lower()

def get_list_wav_and_emotion(path_audio,path_split_audio,model_bert,type_model="base"):

    list_wavs=[]
    list_emotions=[]
    DEVICE = "cuda" if torch.cuda.is_available() else "cpu"
    print(":Device",DEVICE)
    start_t = timeit.default_timer()
    model = whisper.load_model(type_model)
    load_t = timeit.default_timer()
    print("############# Load time: ",load_t-start_t)
    result = model.transcribe(path_audio)
    load_t1 = timeit.default_timer()
    print("############# Transcribe time: ",load_t1-load_t)
    audio_pydub= AudioSegment.from_wav(path_audio)
    # load_t2 = timeit.default_timer()

    for i,value in enumerate(result["segments"]):
        start_audio= value["start"]
        end_audio=value["end"]
        text_audio=value["text"]
        name_audio="doc_"+str(i)+".wav"
        audio_pydub_new = audio_pydub[start_audio*1000:end_audio*1000]
        audio_pydub_new.export(os.path.join(path_split_audio,name_audio), format="wav")
        # path_split_audio_current= os.path.join(CURRENT_PATH,path_split_audio)
        # list_wavs.append(os.path.join(path_split_audio_current,name_audio.split(".wav")[0]))
        list_wavs.append(name_audio.split(".wav")[0])
        list_emotions.append(getEmotion(text_audio,model_bert))

    return list_wavs,list_emotions



def concat_audio(path_folder_audio,path_save,fps):
    L = []
    files=[os.path.join(path_folder_audio,value) for value in os.listdir(path_folder_audio)]

    files = natsorted(files)

    # exit()
    for file in files:
        if(file.endswith(".avi")):
            continue
        video = VideoFileClip(file)
        L.append(video)
    final_clip = concatenate_videoclips(L)#.without_audio()
    # path_save = os.path.join(CURRENT_PATH,"final_output",path_save)
    path_folder = Path(path_save).parent.absolute()

    if(os.path.exists(path_folder)==False):
        os.mkdir(path_folder)

    print("path_save ",path_save)
    final_clip.write_videofile(path_save, fps=fps, remove_temp=True)


# put text audio
def put_text(text,input_audio,path_save,x="right"):
    if x == "center":
        w = "(w-text_w)/2"
        h = "(h-text_h)/2"
    elif x == "right":
        w = "1100"
        h = "30"
    else:
        w = "0"
        y = "0"

    os.system(f"""ffmpeg -y -i {input_audio} -vf drawtext="fontfile=/path/to/font.ttf: \
    text={text}: fontcolor=white: fontsize=24: box=1: boxcolor=black@0.5: \
    boxborderw=5: x={w}: y={h}" -codec:a copy {path_save}""")


# export gazo
def export_mp4_gazo(list_wavs,
                    list_emotions,
                    path_x86_64,
                    path_source_gazo,
                    path_input_mouth_closed,
                    path_input_mouth_open,
                    path_input_blinking_mouth_open,
                    path_input_blinking_mouth_closed,
                    path_split_audio,
                    path_save_folder_mp4,
                    fps,
                    scale_image
                    ):
    path_save_folder_mp4_gazo=os.path.join(CURRENT_PATH,path_save_folder_mp4)

    for i,name_file in enumerate(list_wavs):
        path=os.path.join(CURRENT_PATH,path_split_audio,name_file)
        os.system(f"{path_x86_64} --path {path_source_gazo} --image={path_input_mouth_closed},{path_input_mouth_open},{path_input_blinking_mouth_open},{path_input_blinking_mouth_closed} --output_mp4={os.path.join(path_save_folder_mp4_gazo,name_file)}.mp4 --write-movie {os.path.join(path_save_folder_mp4_gazo,name_file)}.avi --fixed-fps {fps} --input_audio={path}.wav --emotion={list_emotions[i]} --scale_image={scale_image}")
        put_text(list_emotions[i],os.path.join(path_save_folder_mp4,name_file)+".mp4",os.path.join(path_save_folder_mp4,name_file)+"_put_text.mp4")
        os.remove(os.path.join(path_save_folder_mp4,name_file)+".mp4")


def export_final(list_wavs,list_emotions,path_x86_64,path_source_gazo,path_input_mouth_closed,path_input_mouth_open,path_input_blinking_mouth_open,path_input_blinking_mouth_closed,path_split_audio,path_save_sub_audio,path_concat_all_sub_audio,fps,scale_image):
    export_mp4_gazo(list_wavs,
                list_emotions,
                path_x86_64,
                path_source_gazo,
                path_input_mouth_closed,
                path_input_mouth_open,
                path_input_blinking_mouth_open,
                path_input_blinking_mouth_closed,
                path_split_audio,
                path_save_sub_audio,
                fps,
                scale_image
                )
    concat_audio(path_save_sub_audio,path_concat_all_sub_audio,fps)



def run_e2e(model_bert,path_x86_64,path_source_gazo,path_input_mouth_closed,path_input_mouth_open,path_input_blinking_mouth_open,path_input_blinking_mouth_closed,path_save_sub_audio,path_concat_all_sub_audio,fps,scale_image,path_split_audio,path_audio,type_model):
    # model_bert=os.path.join(CURRENT_PATH,model_bert)
    path_input_mouth_closed=os.path.join(CURRENT_PATH,path_input_mouth_closed)
    path_input_mouth_open=os.path.join(CURRENT_PATH,path_input_mouth_open)
    path_input_blinking_mouth_open=os.path.join(CURRENT_PATH,path_input_blinking_mouth_open)
    path_input_blinking_mouth_closed=os.path.join(CURRENT_PATH,path_input_blinking_mouth_closed)

    path_x86_64=os.path.join(CURRENT_PATH,path_x86_64)
    path_source_gazo=os.path.join(CURRENT_PATH,path_source_gazo)
    path_save_sub_audio=os.path.join(CURRENT_PATH,path_save_sub_audio)
    # path_concat_all_sub_audio=os.path.join(CURRENT_PATH,"final_output",path_concat_all_sub_audio)
    path_split_audio=os.path.join(CURRENT_PATH,path_split_audio)
    path_audio=os.path.join(CURRENT_PATH,"input_audio",path_audio)


    if(os.path.exists(path_split_audio)==False):
        os.mkdir(path_split_audio)
    if(os.path.exists(path_save_sub_audio)==False):
        os.mkdir(path_save_sub_audio)




    list_wavs,list_emotions=get_list_wav_and_emotion(path_audio,path_split_audio,model_bert,type_model)

    # exit()
    export_final(list_wavs,
                list_emotions,
                path_x86_64,
                path_source_gazo,
                path_input_mouth_closed,
                path_input_mouth_open,
                path_input_blinking_mouth_open,
                path_input_blinking_mouth_closed,
                path_split_audio,
                path_save_sub_audio,
                path_concat_all_sub_audio,
                fps,
                scale_image)



    files = glob.glob(os.path.join(path_split_audio,'*'))
    for f in files:
        os.remove(f)

    files=glob.glob(os.path.join(path_save_sub_audio,"*"))
    for f in files:
        os.remove(f)


    files = glob.glob(os.path.join("C:/Users/Administrator/Documents/Gazo_emotion/resize_input",'*'))
    for f in files:
        os.remove(f)


def save_image_resize(path_image,path_image_resize):
    SIZE_IMAGE=500
    img=cv2.imread(path_image)
    width= img.shape[1]
    height=img.shape[0]
    scale= SIZE_IMAGE/max(width,height)

    im = PIL.Image.open(path_image)
    size = (width,height)
    im = im.resize(size, PIL.Image.LINEAR)
    im.save(path_image_resize)
    # img=cv2.resize(img,(int(scale*width),int(scale*height)))
    # cv2.imwrite(path_image_resize, img)




if __name__ == "__main__":

    if 'DISPLAY' not in os.environ:
        os.environ['DISPLAY'] = ":0"

    parser = argparse.ArgumentParser()
    parser.add_argument('--model_bert', default='BertGoEmotion/modelBert')
    parser.add_argument('--path_x86_64', default='Godot_v4.0-beta4_linux.x86_64')
    parser.add_argument('--path_source_gazo', default='Gazor_Vietteam_godot4.0')


    parser.add_argument('--path_input_mouth_closed', default='/media/anlab/DATA/gazotuber/End2End_gazo/Gazor_Vietteam_godot4.0/frames_for_testing/closedmouthfront.png')
    parser.add_argument('--path_input_mouth_open', default='/media/anlab/DATA/gazotuber/End2End_gazo/Gazor_Vietteam_godot4.0/frames_for_testing/openmouthfront.png')
    parser.add_argument('--path_input_blinking_mouth_open', default='')
    parser.add_argument('--path_input_blinking_mouth_closed', default='')



    parser.add_argument('--fps', default=120)
    parser.add_argument('--scale_image', default=1.3)

    parser.add_argument('--type_model_whisper', default="base")

    parser.add_argument('--path_save_sub_mp4_gazo', default='output_predict_gazo') # folder contain mp4
    parser.add_argument('--path_split_audio', default="save_sub_audio")  # folder contain split audio

    parser.add_argument('--path_input_audio', default="doc_27_12_2022TEMP_MPY_wvf_snd.wav") #input audio
    parser.add_argument('--name_output', default="final_output/result.mp4")  #name output
    a = parser.parse_args()



    model_bert=os.path.join(CURRENT_PATH,a.model_bert)
    model_bert=loadModel(model_bert)
    path_x86_64=a.path_x86_64
    path_source_gazo=a.path_source_gazo


    path_input_mouth_closed=a.path_input_mouth_closed
    path_input_mouth_open=a.path_input_mouth_open
    path_input_blinking_mouth_open=a.path_input_blinking_mouth_open
    path_input_blinking_mouth_closed=a.path_input_blinking_mouth_closed


    path_save_sub_mp4_gazo=a.path_save_sub_mp4_gazo # folder contain mp4
    name_output=a.name_output #name output
    fps=a.fps
    scale_image=a.scale_image
    path_split_audio=a.path_split_audio # folder contain split audio
    type_model_whisper=a.type_model_whisper
    path_input_audio=a.path_input_audio #input audio


    ####change size image input####
    name_path_input_mouth_closed=path_input_mouth_closed.split(".")[-1]
    save_image_resize(path_input_mouth_closed,os.path.join(CURRENT_PATH,f"resize_input/mouth_close.{name_path_input_mouth_closed}"))
    save_image_resize(path_input_mouth_open,os.path.join(CURRENT_PATH,f"resize_input/mouth_open.{name_path_input_mouth_closed}"))
    if(os.path.exists(path_input_blinking_mouth_open)==True):
        save_image_resize(path_input_blinking_mouth_open,os.path.join(CURRENT_PATH,f"resize_input/mouth_open_blink.{name_path_input_mouth_closed}"))
    else:
        save_image_resize(path_input_mouth_open,os.path.join(CURRENT_PATH,f"resize_input/mouth_open_blink.{name_path_input_mouth_closed}"))
    if(os.path.exists(path_input_blinking_mouth_closed)==True):
        save_image_resize(path_input_blinking_mouth_closed,os.path.join(CURRENT_PATH,f"resize_input/mouth_close_blink.{name_path_input_mouth_closed}"))
    else:
        save_image_resize(path_input_mouth_closed,os.path.join(CURRENT_PATH,f"resize_input/mouth_close_blink.{name_path_input_mouth_closed}"))
    
    path_input_mouth_closed=os.path.join(CURRENT_PATH,f"resize_input/mouth_close.{name_path_input_mouth_closed}")
    path_input_mouth_open=os.path.join(CURRENT_PATH,f"resize_input/mouth_open.{name_path_input_mouth_closed}")
    path_input_blinking_mouth_open=os.path.join(CURRENT_PATH,f"resize_input/mouth_open_blink.{name_path_input_mouth_closed}")
    path_input_blinking_mouth_closed=os.path.join(CURRENT_PATH,f"resize_input/mouth_close_blink.{name_path_input_mouth_closed}")
    ################################

    run_e2e(model_bert,
            path_x86_64,
            path_source_gazo,
            path_input_mouth_closed,
            path_input_mouth_open,
            path_input_blinking_mouth_open,
            path_input_blinking_mouth_closed,
            path_save_sub_mp4_gazo,
            name_output,
            fps,
            scale_image,
            path_split_audio,
            path_input_audio,
            type_model_whisper)
     ################################
    ##################
