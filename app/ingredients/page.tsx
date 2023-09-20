'use client'
import { getIngredients } from "@/prisma/helpers/getIngredients";
import { useEffect, useState } from "react"

interface Ingredient {
  id: number;
  name: string;
  description: string;
  categoryId: number;
}

const Ingredients = () => {
  const [ingredients, setIngredients] = useState([]);

  const fetchIngredients = () => {
    getIngredients()
    .then((data) => {
      console.log(data);
      setIngredients(data)
    })
  }

  useEffect(() => {
    fetchIngredients()
  }, [])

  const ingredientList = ingredients.map((ing : Ingredient) => {
    console.log(ing)
    return <div key={ing.name}>{ing.name}</div>
  })
  return (
    <div>{ingredientList}</div>
  )
}

export default Ingredients