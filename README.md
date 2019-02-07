# -Boundary-Tracing
Image Processing


Approach 1: Boundary Tracing
This approach leverages Boundary Tracing as a method to extract the boundaries of the two largest circles in the original image.  This approach is based on getting the coordinates of border pixels and connecting them to create boundaries. In this approach, [B,L,n] = bwboundaries(___), “n” returns the number of the boundaries detected. This method is applied to binary version of the original image.
Before applying this operator, I have used “Unsharp Masking”to highlight the two circles boundaries. Then the image is inverted as so the code will be able to detect the inner circle.

Approach 2: Area Filter
Different to to Approach 1 which is based on border pixels, in this approach objects are defined as region. This approach is less complex comparing to approach 1 since -by using BW2 = bwareafilt(BW,n)- areas can be displayed based on the size(two largest circle as specified by question).
Similar to approach 1, I have enhanced the original image to make the filtering operation more precise. A “closing ”operator is applied to the image to ensure closed areas around the two intended circle and based on the results, binary version of the image is created.
