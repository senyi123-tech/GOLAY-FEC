function interleave_code = fec_encode(data)
    % 划分数据为 A 和 B
    A = data(1:12);
    B = data(13:24);

    % 对 A 和 B 进行编码
    encode_A = encode_golay24(A);
    encode_B = encode_golay24(B);
    % 显示结果
disp('经过编码数据：');
   disp( encode_A);
   disp( encode_B);
    % 进行交织
    interleave_code = interleave_data(encode_A, encode_B);
    disp('经过交织数据：');
   disp( interleave_code);
end