%function [Minv, Msqr, Mcube] = myFunc(M)
function varargout = myFunc2(varargin)
    %disp([size(varargin{1}, 1) size(varargin{1}, 2)]);
try
    for i = 1 : nargin
    if size(varargin{i}, 1) ~= size(varargin{i}, 2)
        throw(3);
    end
    end
    if nargin == 1
        varargout{1} = inv(varargin{1});
        varargout{2} = varargin{1}^2;
        varargout{3} = varargin{1}^3;
    else
        varargout{1} = inv(varargin{1});
        varargout{2} = varargin{1}^2;
        varargout{3} = varargin{1}^3;
        varargout{4} = varargin{1}*varargin{2};
        varargout{5} = varargin{2}*varargin{1};
    end
catch exception
    disp('You entered NON-SQAURED matrix');
end
end

[Minv, Msqr, Mcube] = myFunc2([3 2; 1 2]);
disp([Minv, Msqr, Mcube]);
[Minv, Msqr, Mcube, M12, M21] = myFunc2([3 2; 1 2], [1 1; 1 1]);
disp([Minv, Msqr, Mcube, M12, M21]);
myFunc2([1 2]);

  