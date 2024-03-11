function data = fec_decode(interleave_code)
    % 使用解交织函数分离出 encode_A 和 encode_B
    [encode_A, encode_B] = deinterleave_data(interleave_code);

    % 对 encode_A 和 encode_B 进行解码
    code_A = decode_golay24(encode_A);
    code_B = decode_golay24(encode_B);

    % 合并解码后的数据
    data = [code_A, code_B];
end
