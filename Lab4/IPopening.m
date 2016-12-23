function [output] = IPopening(img, se)

    eroded = IPerode(img, se);
    output = IPdilate(eroded, se);

end