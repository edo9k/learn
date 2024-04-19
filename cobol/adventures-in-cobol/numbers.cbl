       identification division.
       program-id. circles.

       data division.
       working-storage section.
       77 radius                 pic 9(10)v9(10).
       77 pi                     pic 9v9(10) value 3.1415936535.
       77 r-squared              pic 9(10)v9(10).
       77 r-cubed                pic 9(10)v9(10).
       77 circle-diameter        pic 9(10)v9(10).
       77 circle-circumference   pic 9(10)v9(10).
       77 circle-area            pic 9(10)v9(10).
       77 sphere-area            pic 9(10)v9(10).
       77 sphere-volume          pic 9(10)v9(10).
       77 four-thirds            pic 9(10)v9(10) value 1.3333333.
       77 display-value          pic z(9)9.9(10).

       procedure division.
           display "Circle information".
           display "------ -----------".
           display "What is the radius of the cicle? " 
           with no advancing.
           accept radius.

           display "Ciccle data".
           display "------ ----".
           move radius to display-value.
           display "Circle radius (in units):     " display-value.
           multiply radius by 2 giving circle-diameter.

           display "Circle diameter (in units):   " circle-diameter.
           multiply circle-diameter by pi giving circle-circumference.
           display "Circle circumference (in units): "
           circle-circumference.
           multiply radius by radius giving r-squared.
           multiply pi by r-squared giving circle-area.

           display "Circle area (in square units): " circle-area.

           display " ".
           display "Sphere data".
           display "------ ----".
           multiply pi by 4 giving sphere-area.
           multiply sphere-area by r-squared.
           display "Sphere surface area (in square units): "
           sphere-area.
           multiply r-squared by radius giving r-cubed.
           multiply pi by r-cubed giving sphere-volume. 
           multiply sphere-volume by four-thirds. 
           display "Sphere volume (in cubic units): " sphere-volume.
        stop run.

