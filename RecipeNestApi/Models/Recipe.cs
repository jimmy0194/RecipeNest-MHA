public class Recipe
{
    public int RecipeId { get; set; }
    public int ChefId { get; set; }
    public Chef Chef { get; set; }

    public string Title { get; set; }
    public string Description { get; set; }
    public string Ingredients { get; set; }
    public string Instructions { get; set; }
    public string Tags { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
