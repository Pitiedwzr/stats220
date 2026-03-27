# Load the magick library
library(magick)

# Read the base image, add text
meme <- image_read("./s2ep12b_1.jpg") %>%
  image_annotate(text = "READING THE PROJECT 1 REQUIREMENTS...",
                 size = 80,
                 font = "Impact", # The classical meme font
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "north") %>%
  image_annotate(text = "SEEING I HAVE TO USE CSS",
                 size = 120, # This size will make both text align
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "south") 

# Save as "my_meme.jpg" in the project folder
image_write(meme, "my_meme.png")

# Meme frames
# Frame 1: It's fine
f1 = image_read("./s2ep12b_2.jpg") %>%
  image_annotate(text = "READING THE STATS 220...",
                 size = 120,
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "north") %>%
  image_annotate(text = "PROJECT 1 REQUIREMENTS",
                 size = 120, 
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "south") 

# Frame 2: no it's not
f2 = image_read("./s2ep12b_3.jpg") %>%
  image_annotate(text = "SEEING I HAVE TO",
                 size = 160,
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "north") %>%
  image_annotate(text = "USE CSS",
                 size = 160, 
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "south")

# Frame 3: Getting panic
f3 = image_read("./s2ep12b_3.jpg") %>%
  image_colorize(opacity = 50, color = "red") %>% # Red colour filter
  image_annotate(text = "ABSOLUTELY",
                 size = 160,
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "north") %>%
  image_annotate(text = "NOT",
                 size = 160, 
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "south")

# Frame 4: ight imma head out
f4 = image_read("./s2ep12b_1.jpg") %>%
  image_annotate(text = "IGHT IMMA",
                 size = 160,
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "north") %>%
  image_annotate(text = "HEAD OUT",
                 size = 160, 
                 font = "Impact",
                 color = "#FFFFFF",
                 strokecolor = "#000000",
                 gravity = "south")

# Combine frames
meme_animated <- c(f1, f2, f3, f4) %>%
  image_animate(optimize = TRUE,
                fps = 0.5) # 2 second per frame to protect my eyes

# Save as "my_animated_meme.gif" in the project folder
image_write(meme_animated, "my_animated_meme.gif")
