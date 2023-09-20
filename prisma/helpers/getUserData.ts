import axios from "axios";

export const getUserData = async() => {
  const response = await axios.get("/api/user")
  return response.data;
}

