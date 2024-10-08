function main()
    n = 11;
    tol = 0.00001;
    max_iter = 10000;

    % Generar el sistema
    [A, rho] = generar_sistema(n);

    % Resolver con Jacobi
    [phi_jacobi, error_jacobi] = jacobi(A, rho, tol, max_iter);
    disp("Solución Jacobi:");
    disp(phi_jacobi);

    % Resolver con Gauss-Seidel
    [phi_gauss, error_gauss] = gauss_seidel(A, rho, tol, max_iter);
    disp("Solución Gauss-Seidel:");
    disp(phi_gauss);

      % Gráficos
     x = linspace(0, 1, n);  % Vector de posiciones para graficar
     plot(x, phi_jacobi, 'r-o', 'DisplayName', 'Jacobi');
     hold on;
     plot(x, phi_gauss, 'b-*', 'DisplayName', 'Gauss-Seidel');
     xlabel('x');
     ylabel('Solución \phi');
     title('Comparación de Jacobi y Gauss-Seidel');
     legend show;
     hold off;

    % Gráfico comparativo de la convergencia
    iter_jacobi = length(error_jacobi);
    iter_gauss = length(error_gauss);

    figure;
    semilogy(1:iter_jacobi, error_jacobi, 'r-o', 'DisplayName', 'Jacobi');
    hold on;
    semilogy(1:iter_gauss, error_gauss, 'b-*', 'DisplayName', 'Gauss-Seidel');
    xlabel('Iteraciones');
    ylabel('Error (norma del residuo)');
    title('Velocidad de Convergencia: Jacobi vs Gauss-Seidel');
    legend show;
    hold off;
end

