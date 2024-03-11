function decoded_data = decode_golay24(encoded_data)
    % Golay(24,12)解码
    H = [1 1 1 1 1 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0;
         0 1 1 1 1 1 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0;
         1 1 0 0 0 1 1 1 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0 0;
         0 1 1 0 0 0 1 1 1 0 1 1 0 0 0 1 0 0 0 0 0 0 0 0;
         1 1 0 0 1 0 0 0 1 1 1 1 0 0 0 0 1 0 0 0 0 0 0 0;
         1 0 0 1 1 1 0 1 0 1 0 1 0 0 0 0 0 1 0 0 0 0 0 0;
         1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0;
         0 1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0 0;
         0 0 1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0 0;
         0 0 0 1 0 1 1 0 1 1 1 1 0 0 0 0 0 0 0 0 0 1 0 0;
         1 1 1 1 0 0 1 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 1 0;
         1 0 1 0 1 1 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 1];

    syndrome = mod(encoded_data * H', 2);
    
    if sum(syndrome) == 0
        % 没有错误，直接返回
        decoded_data = encoded_data(1:12);
    else
        % 有错误，进行错误纠正
        corrected_data = correct_errors(encoded_data, syndrome, H);
        decoded_data = corrected_data(1:12);
    end
end

function corrected_data = correct_errors(encoded_data, syndrome, H)
    % 错误纠正函数
    error_vector = zeros(1, 24);

    % 查找对应的错误位索引
    error_index = find(ismember(H', syndrome, 'rows'));

    % 处理错误位
    if ~isempty(error_index)
        error_vector(error_index) = 1;
    end

    % 翻转错误位
    corrected_data = encoded_data;
    corrected_data(error_vector == 1) = mod(corrected_data(error_vector == 1) + 1, 2);
end
