function run = FingerCompare(user_number,run)
    name1 = ['USER',num2str(user_number),'-Finger'];
    name2 = ['USER',num2str(user_number),'-FingerNoPad'];
    run = FuncAnalyzeVibes(run,name1);
    run = FuncAnalyzeVibes(run,name2);
end

