function corrupted_code = simulate_transmission_errors(interleave_code, n)
    % 复制原始数据
    corrupted_code = interleave_code;

    % 随机选择n个位置并翻转数据
    indices = randperm(length(interleave_code), n);

    % 翻转选定位置的数据
    for i = 1:n
        if corrupted_code(indices(i)) == 0
            corrupted_code(indices(i)) = 1;
        else
            corrupted_code(indices(i)) = 0;
        end
    end
end
