import logo from "../assets/logo.png";

const Navbar = ({ web3Handler, account }) => {
  return (
    <nav className="flex-between">
      <a
        className="flex"
        href="http://www.google.com/search?q=xxx+college"
        target="_blank"
        rel="noopener noreferrer"
      >
        <img src={logo} className="App-logo" alt="logo" />
        Bates College
      </a>

      {account ? (
        <a
          href={`${""}/address/${account}`}
          target="_blank"
          rel="noopener noreferrer"
          className="button"
        >
          {/* displays first 5 and last 5 digits of the web address */}
          {account.slice(0, 5) + "..." + account.slice(38, 42)}{" "}
        </a>
      ) : (
        <button onClick={web3Handler} className="button">
          Connect Wallet
        </button>
      )}
    </nav>
  );
};

export default Navbar;
