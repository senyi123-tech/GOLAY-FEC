% 解交织函数
function [A, B] = deinterleave_data(C)
    % 假设末尾的字符为 'S'，作为分隔符
    % 从交织后的数据 C 中分离出数据 A 和数据 B
    A = C(1:2:end-1);
    B = C(2:2:end-1);
end
