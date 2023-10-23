const Plane = () => {
  // 3.js lib for our plot or ground
  // geometry + material = mesh
  return (
    <mesh position={[0, 0, 0]}>
      <planeGeometry args={[50, 50]} />
      <meshStandardMaterial color={"#404040"} />
    </mesh>
  );
};

export default Plane;
