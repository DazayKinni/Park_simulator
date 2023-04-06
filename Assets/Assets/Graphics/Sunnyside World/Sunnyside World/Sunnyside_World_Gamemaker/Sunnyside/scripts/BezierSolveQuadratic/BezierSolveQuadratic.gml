function BezierSolveQuadratic(argument0, argument1, argument2) {
	var a = argument0;
	var b = argument1;
	var c = argument2;

	var det = sqrt(b*b - 4*a*c);

	var result = (-b + det) / (2*a);
	if ((result >= 0) && (result <= 1)) return result;

	result = (-b - det) / (2*a);
	if ((result >= 0) && (result <= 1)) return result;

	return undefined;


}
