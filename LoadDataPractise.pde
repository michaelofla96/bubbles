Table table;
ArrayList<Expense> exp = new ArrayList<Expense>();

void setup()
{
  size(500,500);
  table = loadTable("data.tsv", "header");
  
  println(table.getRowCount() + "total rows in table");
  
  printall();
  loadExpenses();
  drawExpenseBars();
  drawLine();
}

void printall()
{
  for(Expense e: exp)
  {
    println(e);
  }
  
}

void loadExpenses()
{
    for (TableRow row : table.rows())
  {
    Expense e = new Expense(row.getString("name")
    , row.getString("party")
    , row.getString("constituency")
    , row.getFloat("returned")
    , row.getFloat("claimed")
    );
    exp.add(e);
  }
}

void drawExpenseBars()
{
  float value = 0;
  float spacing = height/exp.size();
  for (int i = 0; i < exp.size(); i++) {
    value = (((Expense) exp.get(i)).claimed) / width * 4;
    noStroke();
    fill(exp.get(i).c);
    rect(0,spacing,value,height/exp.size());
    spacing += height /exp.size() + 0.9;
  }
}

void drawLine()
{
  stroke(0);
  line(480, 20, 480, 480);
  rect(30,60,80,20);
}

void draw()
{
}