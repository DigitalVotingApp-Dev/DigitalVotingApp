fid = fopen('14.txt', 'rt');
header_line = fgetl(fid);
var_names = matlab.lang.makeValidName( regexprep(regexp(header_line,'[;,]','split'), '"', '') );
line_fmt = repmat('%f', 1, length(var_names));
datacell = textscan(fid, line_fmt, 'CollectOutput', 1, 'Delimiter', ',');
fclose(fid);
your_data = array2table( datacell{1}, 'VariableNames', var_names);
save('2.mat', 'header_line', 'your_data');