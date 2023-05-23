LevelTable = Spring_Data(1);
Q_Table = Q_State();

% Initializing ------------------------------------------------------------
Q_Table.Properties.VariableNames(1) = {'0'};
Action_0 = cell2mat(Q_Table.Properties.VariableNames(1));
Action_0 = str2double(Action_0);
Q_Table.Properties.VariableNames(2) = {'1'};
Action_1 = cell2mat(Q_Table.Properties.VariableNames(2));
Action_1 = str2double(Action_1);
Q_Table.Properties.VariableNames(3) = {'2'};
Action_2 = cell2mat(Q_Table.Properties.VariableNames(3));
Action_2 = str2double(Action_2);

Action = [Action_0 Action_1 Action_2];

Init = 1000000;

for i = 1:length(Q_Table.Row)
    for j = 1:length(Q_Table.Properties.VariableNames)
        Q_Table(i,j) = num2cell(Init);
    end
end

% 하이퍼 파라미터 ----------------------------------------------------------
alpha = 0.1;
gamma = 0.9;
epsilon = 0.1;
Vehicle_Cost = 160;
rng(46);    
s = rng;
% -------------------------------------------------------------------------
Q_Table_3D = table2array(Q_Table);

random_q_table = array2table(table2array(Q_Table));
% Q_Learning --------------------------------------------------------------
Random_Action = [1 2 3];
for b = 1:10
    for a = 1:1
        for i = 1:length(LevelTable.Gaussian_Grid) - 2
            for j = 1:length(Q_Table.Row)
                if LevelTable.State(i) == cell2mat(Q_Table.Row(j))
                    % for l = 1:3
                        if rand < (1-epsilon) % 1-입실론 그리디에 의한 액션
                            Minus_Epsilon_Action = find(min(table2array(Q_Table(j,:))) == table2array(Q_Table(j,:)));
                            if length(Minus_Epsilon_Action) == 1 %현재 스테이트의 최솟값이 하나일 때
                                [J,K] = min(table2array(Q_Table(j,:)));
                                K_List(i,1) = K;
                                Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                                Reward_List(i,1) = Reward;
                                Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
                                % disp("1min")
                                % disp(Q_Table(j,K))
                                Q_Table_3D(:,:,i) = 0;
                                if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i)
                                    Q_Table_3D(j,K,i) = table2array(Q_Table(j,K));
                                end
                            else %현재 스테이트의 최솟값이 여러개일 때
                                Minus_Epsilon_Action_Random_Min = randi(length(Minus_Epsilon_Action),1);
                                Minus_Epsilon_Action_Random_Min_list(i,1) = Minus_Epsilon_Action_Random_Min;
                                K = Minus_Epsilon_Action(Minus_Epsilon_Action_Random_Min);
                                K_List(i,1) = K;
                                Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                                Reward_List(i,1) = Reward;
                                Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
                                % disp("minsss")
                                % disp(Q_Table(j,K))
                                Q_Table_3D(:,:,i) = 0;
                                if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i)
                                    Q_Table_3D(j,K,i) = table2array(Q_Table(j,K));
                                end
                            end
                        else %입실론 그리디에 의한 액션 --------------------------------
                            Epsilon_Random = randi(length(Action),1);
                            Epsilon_Random_list(i,1) = Epsilon_Random;
                            K = Random_Action(Epsilon_Random);
                            K_List(i,1) = K;
                            Reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(K))),0)*LevelTable.State_Cost(i)) + ((50*Action(K))*Vehicle_Cost));
                            Reward_List(i,1) = Reward;
                            Q_Table(j,K) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),K)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));
                            % disp("epsilon")
                            % disp(Q_Table(j,K))
                            Q_Table_3D(:,:,i) = 0;
                            if table2array(Q_Table(j,K)) ~= Q_Table_3D(j,K,i)
                                Q_Table_3D(j,K,i) = table2array(Q_Table(j,K));
                            end
                        end
                    % end
                end
            end
        end
    end
end

% 하루치의 Reward값을 더한 변수, 마지막 하루는 포함X ------------------------
for i = 1:fix(length(Reward_List)/24)-1
    Year_Reward(i,1) = sum(Reward_List(((24*(i-1))+1):(24*i)));
end

% Moving Average ----------------------------------------------------------
for i = 1:fix(length(Reward_List)/24)-1
    Moving_Average(i,1) = sum(Year_Reward(i:i+89))/90;
    if i + 90 == fix(length(Reward_List)/24)-1
        break;
    end
end


% Random Q ----------------------------------------------------------------
for i = 1:length(LevelTable.Gaussian_Grid) - 2
    for j = 1:length(Q_Table.Row)
        if LevelTable.State(i) == cell2mat(Q_Table.Row(j))
            random_k = randi(3,1);
            random_reward = ((max((LevelTable.Gaussian_Grid(i)-(50*Action(random_k))),0)*LevelTable.State_Cost(i)) + ((50*Action(random_k))*Vehicle_Cost));
            Random_Reward_List(i,1) = random_reward;
            random_q_table(j,random_k) = num2cell(((1-alpha)*(table2array(Q_Table(LevelTable.State(i),random_k)))) + (alpha*(Reward + (gamma*(min(table2array(Q_Table(LevelTable.State(i+1),:))))))));                    
        end
    end
end

for i = 1:fix(length(Random_Reward_List)/24)-1
    random_year_reward(i,1) = sum(Random_Reward_List(((24*(i-1))+1):(24*i)));
end

% Random Q Moving Average -------------------------------------------------

for i = 1:fix(length(Random_Reward_List)/24)-1
    Random_Moving_Average(i,1) = sum(random_year_reward(i:i+89))/90;
    if i + 90 == fix(length(Random_Reward_List)/24)-1
        break;
    end
end

% Graph -------------------------------------------------------------------

% subplot(121), plot(Year_Reward)
% subplot(122), plot(random_year_reward)


% plot(random_year_reward,'g')
% hold on
% plot(Year_Reward,'r')
% hold on
plot(Random_Moving_Average,'b')
hold on
plot(Moving_Average,"--r")
legend('Random','Proposed','Location','ne')
xlabel('Time(Day)')
ylabel('Electricity Fee')
xlim([0 1700])