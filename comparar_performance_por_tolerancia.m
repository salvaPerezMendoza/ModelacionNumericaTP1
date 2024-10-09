function comparar_performance_por_tolerancia()
    max_iter = 10000;
    tolerancias = [0.00001, 0.0001, 0.001];  % Diferentes tolerancias
    n = 101;

    for i = 1:length(tolerancias)
        tol = tolerancias(i);  % Usar paréntesis para acceder a los elementos del array
        fprintf('--- Sistema con tolerancia = %e ---\n', tol);  % Mostrar tolerancia en formato científico

        % Generar el sistema
        [A, rho] = generar_sistema(n);
        init_value = 1;  % Solución inicial con todos los elementos en 1

        % Medir tiempo de Jacobi
        tic;
        [phi_jacobi, iter_jacobi] = jacobi(A, rho, tol, max_iter);
        tiempo_jacobi = toc;
        fprintf('Jacobi tomó %f segundos y %d iteraciones.\n', tiempo_jacobi, length(iter_jacobi));

        % Medir tiempo de Gauss-Seidel
        tic;
        [phi_gauss, iter_gauss] = gauss_seidel(A, rho, tol, max_iter);
        tiempo_gauss = toc;
        fprintf('Gauss-Seidel tomó %f segundos y %d iteraciones.\n', tiempo_gauss, length(iter_gauss));

        % Comparar soluciones
        error_jacobi = norm(A*phi_jacobi - rho, inf);
        error_gauss = norm(A*phi_gauss - rho, inf);
        fprintf('Error Jacobi: %e | Error Gauss-Seidel: %e\n\n', error_jacobi, error_gauss);
    end
end

