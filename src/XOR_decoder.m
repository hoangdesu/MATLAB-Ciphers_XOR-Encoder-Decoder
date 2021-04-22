% RMIT University Vietnam
% Digital Fundamentals
% Laboratory Exercise 2 - Ciphers
% Authors: Hoang Nguyen (s3697305), Huy Nguyen (s3864185), Anh Nguyen (s3810148)
% User-defined function: XOR_decoder.m
% Argument: cipherKey (integer), cipherText (char array)
% Return: decodedText (char array)

function [decodedText] = XOR_decoder(cipherKey, cipherText)
   cipherKey_bi = de2bi(cipherKey, 8, 'left-msb'); % convert key to binary

   cipherText_int = uint8(cipherText); % convert chars to integer
   cipherText_bi = de2bi(cipherText_int, 8, 'left-msb'); % convert integer to binary
   
   decodedText_bi = xor(cipherKey_bi, cipherText_bi); % perform xor operation on cipher key and cipher text
   decodedText_int = bi2de(decodedText_bi, 'left-msb'); % convert decoded text back to new integer
   decodedText_char = char(decodedText_int); % convert decoded text back to new characters
   
   n = length(cipherText); 
   decodedText = '';
    
   for i = 1:n
       decodedText = append(decodedText, decodedText_char(i)); % build the decoded text
   end
end