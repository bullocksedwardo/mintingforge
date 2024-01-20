import React, { useRef, useEffect } from 'react';

type VideoPlayerProps = React.DetailedHTMLProps<React.VideoHTMLAttributes<HTMLVideoElement>, HTMLVideoElement>

const VideoPlayer: React.FC<VideoPlayerProps> = (props) => {
  const videoRef = useRef<HTMLVideoElement>(null);

  useEffect(() => {
    if (videoRef.current) {
      // You can access the video element using videoRef.current
      // Example: videoRef.current.play();
    }
  }, []);

  return (
    <video ref={videoRef} {...props} />
  );
};

export default VideoPlayer;