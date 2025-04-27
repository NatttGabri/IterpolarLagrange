clc;clear;close all;
% Acá creo una función para hacer interpolación de Lagrange
function [y_interp, error] = lagrange_interp(x_points, y_points, x, valor_real)
    n = length(x_points) - 1; % n es el número de puntos menos uno (el grado del polinomio).
    y_interp = 0;             % Arranco el valor de la interpolación en 0.
    
    % Este for es para calcular cada término del polinomio de Lagrange.
    for i = 0:n
        L = 1;    % Cada polinomio base L empieza en 1.
        for j = 0:n
            if j ~= i   % Si no es el mismo punto, hago el producto.
                L = L * (x - x_points(j+1)) / (x_points(i+1) - x_points(j+1));
                % Esto arma el polinomio base L_i(x) multiplicando todos los factores necesarios.
            end
        end
        % Sumo la contribución de este término al valor final.
        y_interp = y_interp + y_points(i+1) * L;
    end
    
    % Una vez que tengo el valor interpolado, calculo el error relativo en porcentaje.
    error = abs((y_interp - valor_real) / valor_real) * 100;
end

% Primer ejemplo: uso tres puntos medios alejados para interpolar.
x_points = [1, 4, 6];                    % Estos son los x conocidos.
y_points = [0, 1.386294, 1.791759];       % Estos son los ln(x) correspondientes.
[y1, error1] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Quiero interpolar en x=2.
fprintf('Ejemplo 1: ln(2) ≈ %.4f, Error = %.1f%%\n', y1, error1); % Muestro el resultado en pantalla.

% Segundo ejemplo: ahora agarro puntos más cerquita entre sí.
x_points = [1, 2, 3];                    % Nuevos puntos de x (más cercanos a 2).
y_points = [0, 0.6931472, 1.098612];      % Y sus ln(x) correspondientes.
[y2, error2] = lagrange_interp(x_points, y_points, 2, 0.6931472); % Interpolo de nuevo en x=2.
fprintf('Ejemplo 2: ln(2) ≈ %.4f, Error = %.1f%%\n', y2, error2); % Imprimo el resultado también.
