import axios from "axios";

export const getIngredients = async () => {
  const response = await axios.get("/api/ingredients");
  return response.data;
};
