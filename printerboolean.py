
titles = "AND,OR,XOR,A,ERRCASE"
ALUFNs = "8,14,6,10,10"
X_VALUES = "16b0110100001010111"
Y_VALUES = "16b1010110000001000"
S_VALUES = "16h2800,16hec5f,16hc45f,16h6857,16h6857"

tlist = titles.split(",")
string = "{START,"
for i in range(len(titles)):
    string+=titles[i]
    string+=","
string += "PASS,ERROR_STATE}"
print(string)

ALUFN = ALUFNs.split(",")
xlist = X_VALUES.split(",")
ylist = Y_VALUES.split(",")
slist = S_VALUES.split(",")



string = ""
for i in range(len(tlist)-1):
    string += "state.{0}:\n".format(tlist[i])
    string += "boolean.a = A1;\n"
    string += "boolean.b = B1;\n"
    string += "boolean.op = {0};\n".format(ALUFN[i])
    string += "s_reg.d = boolean.s;\n"
    string += "checkoff_reg.d[{0}] = 1;\n".format(5-i)
    string += "flag_reg.d[0] = ( s_reg.q != {0});\n".format(slist[i])
    string += "if (boolean.s == {0})".format(slist[i])
    string += " {\n"
    string += "     if (edge_detector.out == 1)"
    string += "{\n"
    string += "     state.d = state.{0};\n".format(tlist[i+1])
    string += "     }\n"
    string += "} else {\n"
    string += "     state.d = state.ERR;\n"
    string += "}\n\n\n"

i = len(tlist)-1
string += "state.{0}:\n".format(tlist[i])
string += "boolean.a = A1;\n"
string += "boolean.b = B1;\n"
string += "boolean.op = {0};\n".format(ALUFN[i])
string += "s_reg.d = 16hdead;\n"
string += "checkoff_reg.d[{0}] = 1;\n".format(5-i)
string += "flag_reg.d[0] = ( s_reg.q != {0});\n".format(slist[i])
string += "if (boolean.s == {0})".format(slist[i])
string += " {\n"
string += "     if (edge_detector.out == 1)"
string += "{\n"
string += "     state.d = state.PASS;\n"
string += "     }\n"
string += "} else {\n"
string += "     state.d = state.ERR;\n"
string += "}\n\n\n"
print(string)
