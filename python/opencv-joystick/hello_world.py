import cv2
import numpy as np

# Capture video from the default camera (index 0)
cap = cv2.VideoCapture(0)

# Check if the camera opened successfully
if not cap.isOpened():
    print("Error: Could not open camera.")
    exit()

# Initialize position for "Hello World"
text_position = (50, 50)
font = cv2.FONT_HERSHEY_SIMPLEX
font_scale = 1
color = (255, 255, 255)  # White text
thickness = 2

while True:
    # Capture frame-by-frame
    ret, frame = cap.read()
    if not ret:
        print("Failed to grab frame")
        break

    # Convert frame to HSV for color detection
    hsv_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2HSV)

    # Define the range for green color (can adjust for your object)
    lower_green = np.array([40, 40, 40])
    upper_green = np.array([70, 255, 255])

    # Create a mask to detect green objects
    mask = cv2.inRange(hsv_frame, lower_green, upper_green)

    # Find contours of the green object
    contours, _ = cv2.findContours(mask, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    if contours:
        # Get the largest contour (assuming it's the object)
        largest_contour = max(contours, key=cv2.contourArea)
        x, y, w, h = cv2.boundingRect(largest_contour)

        # Update text position based on the detected object's position
        text_position = (x, y)

        # Draw a rectangle around the detected object
        cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 0), 2)

    # Add "Hello World" text to the frame
    cv2.putText(frame, 'Hello, World!', text_position, font, font_scale, color, thickness)

    # Display the frame
    cv2.imshow('Interactive Hello World', frame)

    # Press 'q' on the keyboard to exit
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Release the camera and close all OpenCV windows
cap.release()
cv2.destroyAllWindows()

