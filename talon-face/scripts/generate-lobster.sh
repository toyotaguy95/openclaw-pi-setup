#!/bin/bash
# Generate Talon lobster face GIFs for 720x1280 touch display
# Style: Pixel art red lobster matching talon-pfp.png

cd ~/talon-face/gifs

# Touch display is 720x1280 (portrait)
SIZE="720x1280"
BG="#8BA3B0"        # Blue-gray background from reference
LOBSTER="#E04040"   # Red lobster body
LOBSTER_DARK="#B02020"  # Darker red for shading
LOBSTER_LIGHT="#F06060" # Lighter red for highlights
EYES="#FFFFFF"      # White eyes
PUPILS="#000000"    # Black pupils

echo "Generating Talon faces at $SIZE..."

# Helper: Draw the base lobster body (centered, large)
# Body center at 360,700 (middle of 720x1280)
draw_body() {
    echo "-fill '$LOBSTER' -draw 'ellipse 360,750 120,180 0,360'"  # Main body
    echo "-fill '$LOBSTER' -draw 'ellipse 360,520 100,80 0,360'"   # Head
    echo "-fill '$LOBSTER_DARK' -draw 'ellipse 360,800 100,40 0,360'"  # Body segment
    echo "-fill '$LOBSTER_DARK' -draw 'ellipse 360,880 80,35 0,360'"   # Body segment
    echo "-fill '$LOBSTER_DARK' -draw 'ellipse 360,950 60,30 0,360'"   # Body segment
    echo "-fill '$LOBSTER' -draw 'polygon 360,980 300,1080 420,1080'"  # Tail
    echo "-fill '$LOBSTER_DARK' -draw 'polygon 300,1080 260,1150 340,1150'" # Tail fin left
    echo "-fill '$LOBSTER_DARK' -draw 'polygon 420,1080 380,1150 460,1150'" # Tail fin right
    echo "-fill '$LOBSTER' -draw 'polygon 340,1080 360,1150 380,1080'"      # Tail fin center
}

# === IDLE - Lobster with gentle claw sway ===
echo "Creating idle..."

# Frame 1 - claws slightly up
convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 310,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 410,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    idle_1.png

# Frame 2 - claws slightly different position
convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 310,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 410,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 175,560 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 545,560 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 125,550 70,500 95,530 135,555" \
    -fill "$LOBSTER" -draw "polygon 125,570 70,540 95,555 135,570" \
    -fill "$LOBSTER" -draw "polygon 595,550 650,500 625,530 585,555" \
    -fill "$LOBSTER" -draw "polygon 595,570 650,540 625,555 585,570" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    idle_2.png

convert -delay 80 -loop 0 idle_1.png idle_2.png idle.gif
echo "✓ idle.gif"

# === THINKING - Eyes looking up, thought bubbles ===
echo "Creating thinking..."

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 315,485 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 415,485 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -draw "ellipse 550,350 20,20 0,360" \
    thinking_1.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 315,485 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 415,485 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -draw "ellipse 550,350 20,20 0,360" \
    -fill "$EYES" -draw "ellipse 590,280 28,28 0,360" \
    thinking_2.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 315,485 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 415,485 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -draw "ellipse 550,350 20,20 0,360" \
    -fill "$EYES" -draw "ellipse 590,280 28,28 0,360" \
    -fill "$EYES" -draw "ellipse 620,200 38,38 0,360" \
    thinking_3.png

convert -delay 50 -loop 0 thinking_1.png thinking_2.png thinking_3.png thinking_2.png thinking.gif
echo "✓ thinking.gif"

# === SPEAKING - Mouth opening/closing ===
echo "Creating speaking..."

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 310,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 410,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,570 25,10 0,360" \
    speaking_1.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 310,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 410,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 180,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,550 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,540 80,480 100,520 140,550" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,540 140,560" \
    -fill "$LOBSTER" -draw "polygon 590,540 640,480 620,520 580,550" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,540 580,560" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,575 35,20 0,360" \
    speaking_2.png

convert -delay 15 -loop 0 speaking_1.png speaking_2.png speaking.gif
echo "✓ speaking.gif"

# === WORKING - Claws snipping actively ===
echo "Creating working..."

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 305,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 415,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 160,500 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 560,500 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 110,485 50,420 80,460 120,490" \
    -fill "$LOBSTER" -draw "polygon 110,515 50,480 80,495 120,510" \
    -fill "$LOBSTER" -draw "polygon 610,485 670,420 640,460 600,490" \
    -fill "$LOBSTER" -draw "polygon 610,515 670,480 640,495 600,510" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    working_1.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -fill "$EYES" -draw "ellipse 310,500 30,35 0,360" \
    -fill "$EYES" -draw "ellipse 410,500 30,35 0,360" \
    -fill "$PUPILS" -draw "ellipse 315,505 12,15 0,360" \
    -fill "$PUPILS" -draw "ellipse 405,505 12,15 0,360" \
    -fill "$LOBSTER" -draw "ellipse 160,520 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 560,520 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 110,505 50,450 80,480 120,510" \
    -fill "$LOBSTER" -draw "polygon 110,535 50,520 80,525 120,530" \
    -fill "$LOBSTER" -draw "polygon 610,505 670,450 640,480 600,510" \
    -fill "$LOBSTER" -draw "polygon 610,535 670,520 640,525 600,530" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    working_2.png

convert -delay 20 -loop 0 working_1.png working_2.png working.gif
echo "✓ working.gif"

# === SLEEPING - Closed eyes, zzz ===
echo "Creating sleeping..."

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -stroke "$EYES" -strokewidth 6 -fill none \
    -draw "line 280,505 340,505" \
    -draw "line 380,505 440,505" \
    -stroke none \
    -fill "$LOBSTER" -draw "ellipse 180,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,550 140,565" \
    -fill "$LOBSTER" -draw "polygon 130,580 80,560 100,570 140,580" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,550 580,565" \
    -fill "$LOBSTER" -draw "polygon 590,580 640,560 620,570 580,580" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 60 -draw "text 500,380 'z'" \
    sleeping_1.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -stroke "$EYES" -strokewidth 6 -fill none \
    -draw "line 280,505 340,505" \
    -draw "line 380,505 440,505" \
    -stroke none \
    -fill "$LOBSTER" -draw "ellipse 180,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,550 140,565" \
    -fill "$LOBSTER" -draw "polygon 130,580 80,560 100,570 140,580" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,550 580,565" \
    -fill "$LOBSTER" -draw "polygon 590,580 640,560 620,570 580,580" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 60 -draw "text 500,380 'z'" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 50 -draw "text 550,310 'z'" \
    sleeping_2.png

convert -size $SIZE xc:"$BG" \
    -fill "$LOBSTER" -draw "ellipse 360,750 120,180 0,360" \
    -fill "$LOBSTER" -draw "ellipse 360,520 100,80 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,800 100,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,880 80,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 360,950 60,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 360,980 300,1080 420,1080" \
    -fill "$LOBSTER_DARK" -draw "polygon 300,1080 260,1150 340,1150" \
    -fill "$LOBSTER_DARK" -draw "polygon 420,1080 380,1150 460,1150" \
    -fill "$LOBSTER" -draw "polygon 340,1080 360,1150 380,1080" \
    -stroke "$EYES" -strokewidth 6 -fill none \
    -draw "line 280,505 340,505" \
    -draw "line 380,505 440,505" \
    -stroke none \
    -fill "$LOBSTER" -draw "ellipse 180,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "ellipse 540,570 50,30 0,360" \
    -fill "$LOBSTER" -draw "polygon 130,560 80,520 100,550 140,565" \
    -fill "$LOBSTER" -draw "polygon 130,580 80,560 100,570 140,580" \
    -fill "$LOBSTER" -draw "polygon 590,560 640,520 620,550 580,565" \
    -fill "$LOBSTER" -draw "polygon 590,580 640,560 620,570 580,580" \
    -fill "$LOBSTER_DARK" -draw "ellipse 280,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 440,680 15,40 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 260,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 460,720 12,35 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 250,760 10,30 0,360" \
    -fill "$LOBSTER_DARK" -draw "ellipse 470,760 10,30 0,360" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 60 -draw "text 500,380 'z'" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 50 -draw "text 550,310 'z'" \
    -fill "$EYES" -font "DejaVu-Sans" -pointsize 40 -draw "text 590,250 'z'" \
    sleeping_3.png

convert -delay 100 -loop 0 sleeping_1.png sleeping_2.png sleeping_3.png sleeping.gif
echo "✓ sleeping.gif"

# Cleanup PNGs
rm -f *.png

echo ""
echo "All Talon faces generated at $SIZE!"
ls -la *.gif
