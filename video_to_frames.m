% convert the video to images
delete ./lecture/*.jpg
video_name = 'lecture.mp4';
video = VideoReader(video_name);
frame_time = 1/video.FrameRate; % time per frame

start_time = 1829; % extract the video from 720s to 740s
end_time = 1829+20;
stride = 1.5; % one frame per stride frame_time

num_frames = round((end_time - start_time)/stride/frame_time);
num = 0;
%%    
max_num_zeros = ceil(log10(num_frames)); 
for i = start_time : frame_time*stride : end_time
    num = num + 1;
    video.CurrentTime = i;
    frame = readFrame(video); 
    
    num_zeros = max_num_zeros - floor(log10(num)) - 1;
    name = [num2str(num)];
    for j = 1:num_zeros
       name = ['0', name]; 
    end
    imwrite(frame, ['./lecture/', name, '.jpg']);
end
