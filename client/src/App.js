import React from 'react';
import logo from './logo.svg';
import './App.css';
import {BrowserRouter as Router, Link, Route} from "react-router-dom"
import Otherpage from "./Otherpage"
import Fib from "./Fib"

function App() {
    return (
        <Router>
            <div className="App">
                <header className="App-header">
                    <h3>React app Version 2</h3>
                    <img src={logo} className="App-logo" alt="logo"/>
                    <Link to="/">Home</Link>
                    <Link to="/otherpage">Other Page</Link>
                </header>
                <div>
                    <Route exact path="/" component={Fib}/>
                    <Route path="/otherpage" component={Otherpage}/>
                </div>


            </div>
        </Router>
    );
}

export default App;
