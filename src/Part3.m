% RMIT University Vietnam
% Digital Fundamentals
% Laboratory Exercise 2 - Ciphers
% Authors: Hoang Nguyen (s3697305), Huy Nguyen (s3864185), Anh Nguyen (s3810148)
% File: Part3.m (Brute-Force)

clear, clc;

% Instruction
fprintf('Part 3: Brute-Force\n');
fprintf('(Note: please use the encrypted file with the suffix "_forPart3" to obtain the best result)\n\n');

% Load in a .txt file
[file, path] = uigetfile('*.txt');

% Open the file in read mode
fid1 = fopen(file, 'r'); 
encrypted_message = fread(fid1, '*char');
fclose(fid1);
fprintf('The file "%s" has been read in successfully.\n', file);

% Perform bruteforce attack by calling the user-defined function Bruteforce
[decodedMessages] = Bruteforce(encrypted_message);

n = numel(decodedMessages);

% Build the decrypted message
decrypted_message = sprintf("Bruteforce attack on file:\n%s\n", file);
for key = 1:n
    bruteforced_message = string(decodedMessages(key));
    decrypted_message = decrypted_message + sprintf('\n----- Test key: %i -----\n%s\n', key, bruteforced_message);
end

% Write the decrypted messages with the key to a new file
fileName = split(file, '_');
bruteforcedFile = fileName(1) + "_bruteforced.txt";
fid2 = fopen(bruteforcedFile, 'w');
fwrite(fid2, decrypted_message);
fclose(fid2);
fprintf('Bruteforced file has been written successfully to "%s"\n', bruteforcedFile);