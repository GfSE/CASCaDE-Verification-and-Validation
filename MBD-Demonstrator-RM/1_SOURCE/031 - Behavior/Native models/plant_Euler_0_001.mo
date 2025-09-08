model plant_Euler_0_01
  Modelica.Blocks.Interfaces.RealOutput output_n2 annotation(Placement(visible = true, transformation(origin = {84, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {84, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput output_n3 annotation(Placement(visible = true, transformation(origin = {82, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {82, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction1(a = {0.01, 1}, b = {1}, initType = Modelica.Blocks.Types.Init.InitialState) annotation(Placement(visible = true, transformation(origin = {-62, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction2(a = {3, 2, 5}, b = {1}) annotation(Placement(visible = true, transformation(origin = {6, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.TransferFunction transferFunction3(a = {0.02, 1}, b = {1}) annotation(Placement(visible = true, transformation(origin = {26, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput input_n4 annotation(Placement(visible = true, transformation(origin = {-106, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-96, 68}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(input_n4, transferFunction1.u) annotation(Line(points = {{-106, 66}, {-76, 66}, {-76, 66}, {-74, 66}}, color = {0, 0, 127}));
  connect(transferFunction3.y, output_n3) annotation(Line(points = {{38, -2}, {82, -2}}, color = {0, 0, 127}));
  connect(transferFunction2.y, transferFunction3.u) annotation(Line(points = {{18, 66}, {24, 66}, {24, 34}, {-20, 34}, {-20, -2}, {14, -2}, {14, -2}}, color = {0, 0, 127}));
  connect(transferFunction2.y, output_n2) annotation(Line(points = {{18, 66}, {76, 66}, {76, 64}, {84, 64}}, color = {0, 0, 127}));
  connect(transferFunction1.y, transferFunction2.u) annotation(Line(points = {{-50, 66}, {-8, 66}, {-8, 66}, {-6, 66}}, color = {0, 0, 127}));
  annotation(uses(Modelica(version = "3.2.2")), experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.01), __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "euler"));
end plant_Euler_0_01;