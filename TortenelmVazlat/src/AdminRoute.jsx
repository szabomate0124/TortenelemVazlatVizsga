import { useContext } from "react";
import { Navigate } from "react-router-dom";
import { AuthContext } from "./AuthContext";

function AdminRoute({ children }) {
  const { isAdmin } = useContext(AuthContext);

  if (!isAdmin()) {
    return <Navigate to="/" replace />;
  }

  return children;
}

export default AdminRoute;