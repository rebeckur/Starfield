NormalParticle me = new NormalParticle();

void setup()
{
	//your code here
	size(600,600);
}
void draw()
{
	//your code here
	me.move();
	me.show();
}
class NormalParticle
{
	double x, y, speed, angle;
	int particleColor;

	NormalParticle()
	{
		x = 300.00;
		y = 300.00;
		speed = Math.random()*10;
		angle = Math.random()*(30*Math.PI);
		particleColor = color(190,50,30);
	}

	void move()
	{
		x = x + Math.cos(angle)*speed;
		y = y + Math.sin(angle)*speed;
		
	}

	void show()
	{
		noStroke();
		fill(particleColor);
		ellipse((float)x, (float)y, 6, 6);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

