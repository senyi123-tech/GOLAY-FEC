function interleave_code = interleave_data(A, B)
    % A: 第一个数据向量
    % B: 第二个数据向量

    % 确定交织后的长度
    len_A = length(A);
    len_B = length(B);
    len_C = len_A + len_B + 1;  % 额外添加一个0

    % 初始化交织后的数据向量
    interleave_code = zeros(1, len_C);

    % 进行交织
    idx_A = 1;
    idx_B = 1;
    for i = 1:2:len_C-1
        % 交织 A 和 B 的元素
        if idx_A <= len_A
            interleave_code(i) = A(idx_A);
            idx_A = idx_A + 1;
        end
        if idx_B <= len_B
            interleave_code(i+1) = B(idx_B);
            idx_B = idx_B + 1;
        end
    end

    % 在末尾加上一个额外的0
    interleave_code(end) = 0;
end
