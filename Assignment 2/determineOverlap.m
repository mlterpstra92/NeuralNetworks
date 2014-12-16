function k_nu = determineOverlap(w, xi_nu, S_nu)
    k_nu = (dot(w, xi_nu * S_nu)) / norm(w);
end