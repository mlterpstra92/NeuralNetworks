function [w_1, w_2] = gradient_descent_step(w_1, w_2, xi_nu, tau_nu, learning_rate)
%GRADIENT_DESCENT_STEP Performs a gradient descent step on w_1 and w_2, so
%that the cost function contribution of xi_nu will be lower.

    sigma = ff_output(xi_nu, w_1 ,w_2);
    gradient_1 = (sigma - tau_nu) * (1 - tanh(dot(w_1, xi_nu))^2) * xi_nu;
    gradient_2 = (sigma - tau_nu) * (1 - tanh(dot(w_2, xi_nu))^2) * xi_nu;
    
    w_1 = w_1 - learning_rate * gradient_1;
    w_2 = w_2 - learning_rate * gradient_2;
end