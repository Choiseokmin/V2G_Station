function [Q_Table, Action] = Q_State()
% Q_State 만들기 식--------------------------------------------------------
Time = ["L" "M" "H"];
State_Level = ["0";"1";"2"]
Time = Time';     %10번째 줄 Time의 전치 행렬

for n = 1:length(Time)
    for o = 1:length(Time)
        State_Time(n,o) = append(Time(n),Time(o));
    end
end

State_Time = reshape(State_Time.' ,length(Time)*length(Time),1);

for p = 1:length(State_Time)
    for q = 1:length(State_Level)
        Q_State(p,q) = append(State_Time(p),State_Level(q));
    end
end

Q_State = reshape(Q_State.' , length(State_Time)*length(State_Level),1);
% Q_Action ----------------------------------------------------------------

Action_varTypes = {'double','double','double'};        %열 var의 type
Action_varNames = {'action 0', 'action 1', 'action 2'}; %열 이름
Action_sz = [length(Q_State) length(Action_varNames)];                 %21 by 4 행렬

% Q_Table -----------------------------------------------------------------

Q_Table = table('Size',Action_sz,'RowNames',Q_State,'VariableTypes',Action_varTypes,'VariableNames',Action_varNames);

end