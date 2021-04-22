% RMIT University Vietnam
% Digital Fundamentals
% Laboratory Exercise 2 - Ciphers
% Authors: Hoang Nguyen (s3697305), Huy Nguyen (s3864185), Anh Nguyen (s3810148)
% User-defined function: XOR_encoder.m
% Argument: plainText (char array)
% Return: cipherKey (integer), cipherText (char array)

function [cipherKey, cipherText] = XOR_encoder(plainText)

    cipherKey = randi([1 255], 1); % randomize a key from 1 to 255
    cipherKey_bi = de2bi(cipherKey, 8, 'left-msb'); % convert key to binary

    plainText_int = uint8(plainText); % convert text to integer
    plainText_bi = de2bi(plainText_int, 8, 'left-msb'); % convert text to binary

    cipherText_bi = xor(cipherKey_bi, plainText_bi); % perform xor operation on cipher key and plain text
    cipherText_int = bi2de(cipherText_bi, 'left-msb'); % convert cipher text back to integer
    cipherText_char = char(cipherText_int); % convert cipher text to chars
    
    n = length(plainText);
    cipherText = '';
    
    for i = 1:n
        cipherText = append(cipherText, cipherText_char(i)); % build the cipher text
    end
end