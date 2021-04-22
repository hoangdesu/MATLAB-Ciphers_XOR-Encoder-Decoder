% RMIT University Vietnam
% Digital Fundamentals
% Laboratory Exercise 2 - Ciphers
% Authors: Hoang Nguyen (s3697305), Huy Nguyen (s3864185), Anh Nguyen (s3810148)
% User-defined function: Bruteforce.m
% Argument: cipherText (string)
% Return: decodedMessages (cell)

function [decodedMessages] = Bruteforce(cipherText)
    cipherText_int = uint8(cipherText); % convert characters to unsigned integer 8-bit
    cipherText_bi = de2bi(cipherText_int, 8, 'left-msb'); % convert integer to binary
    
    n = length(cipherText); % get the length of the text
    decodedMessages = {}; % initiate an empty cell
    
    for cipherKey = 1:255 % test 255 possible keys
        cipherKey_bi = de2bi(cipherKey, 8, 'left-msb'); % convert key to binary
        decodedText_bi = xor(cipherText_bi, cipherKey_bi); % perform xor operation on the cipher text and cipher key
        decodedText_int = bi2de(decodedText_bi, 'left-msb'); % convert decoded text back to integer
        decodedText_char = char(decodedText_int); % convert decoded text to char
        decodedText = ''; % initiate an empty character array
        for i = 1:n
            decodedText(i) = decodedText_char(i); % build the character array
        end
        decodedMessages(cipherKey) = {decodedText}; % append the decoded text to the message cell
    end
end