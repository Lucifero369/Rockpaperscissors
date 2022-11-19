clc; clear;

% The winner is determined by the following rules:
% 1. Rock beats scissors; % 2. Scissors beats paper; % 3. Paper beats rock;
% 4. If both players make the same move, then game is a draw.
% Rock = R; % Paper = P; % Scissors = S; % R=1; % P=2; % S=3

n = 1; %Start with game 1
player_win = 0; % Wins of Player
computer_win = 0; % Wins of Computer

% Loop to get atleast 3 games with results
while (n < 4)
    fprintf('\nLet us play the Game #%d \n', n);
    n = n+1; % Increase the game number
    pause(0.5);
    o = 1; % Loop for getting input repeatatively unles proper input is received.
    while o == 1
        close all; % Close all figures if open
        % Question Dialog with 3 inputs of Rock, Paper and Scissor
        player_move = questdlg('Make your move','Rock Paper Scissor','Rock','Paper','Scissor','Rock');
        % Switch case based on player move
        switch player_move
            case 'Rock' %For Rock Selection
                % Read Rock Image to player image and show it in subplot
                pl_img = imread('R1.jpg.png');
                subplot(121); imshow(pl_img);
                title('Player chose Rock');
                o=0;
            case 'Paper' % For Paper Selection
                % Read Paper Image to player image and show it in subplot
                pl_img = imread('P1.png');
                subplot(121); imshow(pl_img);
                title('Player chose Paper');
                o=0;
            case 'Scissor'% For Scissor Selection
                % Read Scissor Image to player image and show it in subplot
                pl_img = imread('S1.png');
                subplot(121); imshow(pl_img);
                title('Player chose Scissors');
                o=0;
            otherwise %otherwise take input again in the loop
                disp('Invalid selection. Choose properly!');
        end
    end
    pause(0.5); % Use Pause for giving time to random number generation
    pause on;
    computer_move = randi(3); % Randomly generate Computer Move and based
    % on the move load Computer Image and show it in the subplot
    if computer_move == 1
        co_img = imread('R2.jpg.png');
        subplot(122); imshow(co_img);
        title('Computer chose Rock')
    elseif computer_move == 2
        co_img = imread('P2.png');
        subplot(122); imshow(co_img);
        title('Computer chose Paper')
    elseif computer_move == 3
        co_img = imread('S2.png');
        subplot(122); imshow(co_img);
        title('Computer chose Scissors')
    end
    pause(0.5);
    %% Rules for Rock Paper Scissors
    % 1. Rock beats scissors
    % 1a: Rock vs 3
    if strcmp(player_move,'Rock') && computer_move == 3
        fprintf('Kudos. You Won!\n');
        player_win = player_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        % 1b: 1 vs Scissor
    elseif computer_move == 1 && strcmp(player_move,'Scissor')
        fprintf('Oops. You Lost :(\n');
        computer_win = computer_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        
        % 2.Scissors beats paper
        % 2a: Scissor vs 2
    elseif strcmp(player_move,'Scissor') && computer_move == 2
        fprintf('Kudos. You Won!\n');
        player_win = player_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        
        % 2b: 3 vs Paper
    elseif computer_move == 3 && strcmp(player_move,'Paper')
        fprintf('Oops. You Lost :(\n');
        computer_win = computer_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        
        % 3. Paper beats rock
        % 3a: Paper vs 1
    elseif strcmp(player_move,'Paper') && computer_move == 1
        fprintf('Kudos. You Won!\n');
        player_win = player_win + 1;
        h = msgbox('You win','Success','custom',pl_img);
        
        % 3b: 2 vs Rock
    elseif computer_move == 2 && strcmp(player_move,'Rock')
        fprintf('Oops. You Lost :(\n');
        computer_win = computer_win + 1;
        h = msgbox('Computer wins','Loss','custom',co_img);
        %.4 if both players make the same move, then game is a draw
        
    else % Else Game is Draw
        fprintf('The Game is draw!\n')
        h = msgbox('The Game is Draw','Draw');
        n = n-1; % Replay the current Game
    end
    pause(2.5); % Pause to show the winner
    delete(h); % Close the message box
end
% Display who is the final winner in set of games
if player_win > computer_win
    fprintf('\n\n\nYou are our ultimate winner.\n\n\n');
else
    fprintf('\n\n\nYou lost the game against computer.\n\n\n');
end