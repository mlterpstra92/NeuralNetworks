function generalizationError = determineError( w, teacherVector )
    generalizationError = acos(dot(w, teacherVector) / (norm(w)*norm(teacherVector))) / pi;

end

