
titles = ["PPP","PNN","P00","PPV","ERR"]
SUMORSUB = "b000000"
X_VALUES = "16h5e94,16h000f,0,16h0001,16h0001";
Y_VALUES = "16h132f,16hffec,0,16h7FFF,16h0001";

S_VALUES = "16h71c3,16hfffb,0,16h8000,16h000f";
Z_VALUES = [0,0,1,0,1];
V_VALUES = [0,0,0,1,1];
N_VALUES = [0,1,0,0,1];

xlist = X_VALUES.split(",")
ylist = Y_VALUES.split(",")
slist = S_VALUES.split(",")

string ="{START,"
for i in range(len(titles)):
    string += titles[i]
    string +=","
string += "END,ERROR_STATE}"
print(string)

string = ""
for i in range(len(titles)):
    string += "// {0}\n".format(titles[i])
    string += "const {0}_X = {1};\n".format(titles[i],xlist[i])
    string += "const {0}_ALUFN = {1};\n".format(titles[i],SUMORSUB)
    string += "const {0}_Y = {1};\n".format(titles[i],ylist[i])
    string += "const {0}_S = {1};\n".format(titles[i],slist[i])
    string += "const {0}_Z = {1};\n".format(titles[i],Z_VALUES[i])
    string += "const {0}_V = {1};\n".format(titles[i],V_VALUES[i])
    string += "const {0}_N = {1};\n".format(titles[i],N_VALUES[i])
    string+= "\n\n"


print(string)
string = ""
for i in range(len(titles)-1):

    string += "// {0}\n".format(titles[i])
    string += "testCase.{0}:\n".format(titles[i])
    string += "fa.x = {0}_X;\n".format(titles[i])
    string += "fa.y = {0}_Y;\n".format(titles[i])
    string += "fa.op = {0}_ALUFN;\n".format(titles[i])
    string += "//turn on io_led to indicate which case we are on\n"
    string += "checkoff_reg.d[{0}] = 1;\n".format(i)
    string += "//wait for the timer\n"
    string += "// check values\n"
    string += "flag_reg.d[3] = (fa.z != {0}_Z);\n".format(titles[i])
    string += "flag_reg.d[2] = (fa.v != {0}_V);\n".format(titles[i])
    string += "flag_reg.d[1] = (fa.n != {0}_N);\n".format(titles[i])
    string += "flag_reg.d[0] = (fa.s != {0}_S);\n".format(titles[i])      
    string += "s_reg.d = fa.s;\n" 
    string += "if (fa.s == {0}_S & fa.z == {0}_Z & fa.n == {0}_N & fa.v == {0}_V)".format(titles[i])
    string += "{\n"
    string += "     if (edge_detector.out == 1) {\n"
    string += "         testCase.d = testCase.{0};\n".format(titles[i+1])
    string += "     }\n"
    string += "     } else {\n"
    string += "         testCase.d = testCase.ERROR_STATE;\n" 
    string +=    "}\n\n\n"

i=len(titles) -1
string += "// {0}\n".format(titles[i])
string += "testCase.{0}:\n".format(titles[i])
string += "fa.x = {0}_X;\n".format(titles[i])
string += "fa.y = {0}_Y;\n".format(titles[i])
string += "fa.op = {0}_ALUFN;\n".format(titles[i])
string += "//turn on io_led to indicate which case we are on\n"
string += "checkoff_reg.d[{0}] = 1;\n".format(i)
string += "//wait for the timer\n"
string += "// check values\n"
string += "flag_reg.d[3] = (fa.z != {0}_Z);\n".format(titles[i])
string += "flag_reg.d[2] = (fa.v != {0}_V);\n".format(titles[i])
string += "flag_reg.d[1] = (fa.n != {0}_N);\n".format(titles[i])
string += "flag_reg.d[0] = (fa.s != {0}_S);\n".format(titles[i])      
string += "s_reg.d = fa.s;\n" 
string += "if (fa.s == {0}_S & fa.z == {0}_Z & fa.n == {0}_N & fa.v == {0}_V)".format(titles[i])
string += "{\n"
string += "     if (edge_detector.out == 1) {\n"
string += "         testCase.d = testCase.{0};\n".format(titles[i])
string += "     }\n"
string += "     } else {\n"
string += "         testCase.d = testCase.ERROR_STATE;\n" 
string +=    "}\n\n\n"
print(string)
