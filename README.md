# Audio Mic Record

This is an example showing how one can record audio from
the microphone and later play it back or save it to a file.

Language: GDScript

Renderer: GLES 2

Check out this demo on the asset library: https://godotengine.org/asset-library/asset/527 \
Download godot 4.0 beta 4 in: [https://downloads.tuxfamily.org/godotengine/4.0/beta4/](url)
# Gazor_Vietteam_godot4.0 cmd input format:
<path_to_binary_file> --path <path_to_project_folder> --image=<path_to_talk_image>,<path_to_silence_image> --input_audio=<path_to_audio> --output_mp4=<path_save_for_mp4> --write-movie <path_save_for_avi> --fixed-fps <fps_video_output>

%Example:
./Downloads/gazosource-20221115T023621Z-001/Godot_4.x86_64 \
--path ~/Downloads/gazosource-20221115T023621Z-001/gazo_Vietteam_4.0_covertgodot_only/ \
--image=/home/anlab/Downloads/gazosource-20221115T023621Z-001/gazo_Vietteam_4.0_covertgodot_only/Risun\ On.png,/home/anlab/Downloads/gazosource-20221115T023621Z-001/gazo_Vietteam_4.0_covertgodot_only/Risun\ Off.png \
--input_audio=/home/anlab/Downloads/audio_file/test_1p_pure.wav \
--output_mp4=/home/anlab/Downloads/gazosource-20221115T023621Z-001/gazo_Vietteam_4.0_covertgodot_only/output_video/output.mp4 \
--write-movie /home/anlab/Downloads/gazosource-20221115T023621Z-001/gazo_Vietteam_4.0_covertgodot_only/output_video/output.avi \
--fixed-fps 30
