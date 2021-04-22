% RMIT University Vietnam
% Digital Fundamentals
% Laboratory Exercise 2 - Ciphers
% Authors: Hoang Nguyen (s3697305), Huy Nguyen (s3864185), Anh Nguyen (s3810148)
% File: Part2.m (encrypting and decrypting text)

clear, clc;

%  --- 1. Encrypting text ---
fprintf('Part 2: Encrypting and Decrypting text\n\n');
fprintf('1. Encrypting Text\n');
% Load in a .txt file
[file, path] = uigetfile('*.txt');

% Open the file in read mode
fid1 = fopen(file, 'r'); 
message = fread(fid1, '*char');
fclose(fid1);
fprintf('The file "%s" has been read in successfully.\n', file);

% Encrypting the message by calling the user-defined function XOR_encoder
[cipherKey, cipherText] = XOR_encoder(message); 

% Writing encrypted message to a new file
fileName = split(file, '.');
encryptedFile = fileName(1) + "_encrypted.txt";

fid2 = fopen(encryptedFile, 'w');
encrypted_message = sprintf('Original file:\n%s\n\nEncrypted message:\n%s', file, cipherText);
fwrite(fid2, encrypted_message);
fclose(fid2);
fprintf('Your message has been encrypted successfully and written to "%s".\n', encryptedFile);

% Generating a file containing only the cipher text to bruteforce for part 3
plainEncryptedFile = fileName(1) + "_forPart3.txt";
fid3 = fopen(plainEncryptedFile, 'w');
fwrite(fid3, cipherText);
fclose(fid3);
fprintf('For part 3, please use the file "%s" to perform bruteforce attack.\n', plainEncryptedFile);

% --- 2. Decrypting text ---
fprintf('\n2. Decrypting text\n');

% Decrypting the message by calling the user-defined function XOR_decoder
decrypted_message = XOR_decoder(cipherKey, cipherText);

% Writing decrypted message to a new file
decryptedFile = fileName(1) + "_decrypted.txt";
fid4 = fopen(decryptedFile, 'w');
decrypted_message = sprintf('Decrypted from file:\n%s\n\nDecrypted message:\n%s', encryptedFile, decrypted_message);
fwrite(fid4, decrypted_message);
fclose(fid4);
fprintf('Your message has been decrypted successfully and written to "%s".\n', decryptedFile);