function out = nck( n, k )
  if(k >  n)
    error('N < K');
  elseif(k == 0)
    out = 1;
  elseif(k > n/2)
    out = nck(n,n-k);
  else
    out = n * nck(n-1,k-1) / k;
  end
end

