import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

import HomeScreen from './screens/HomeScreen';
import StudentScreen from './screens/StudentScreen';
import ProfesorScreen from './screens/ProfesorScreen';
import KolegijiScreen from './screens/KolegijiScreen';
import IspitiScreen from './screens/IspitiScreen';
import SveucilistaScreen from './screens/SveucilistaScreen';
import Header from './components/Header';

function App() {
  return (
    <Router>
      <Header />
      <Routes>
        <Route>
          <Route
            path='/'
            element={<HomeScreen />}
          />
          <Route
            path='/HomeScreen'
            element={<HomeScreen />}
          />
          <Route
            path='/StudentScreen'
            element={<StudentScreen />}
          />
          <Route
            path='/ProfesorScreen'
            element={<ProfesorScreen />}
          />
          <Route
            path='/KolegijiScreen'
            element={<KolegijiScreen />}
          />
          <Route
            path='/IspitiScreen'
            element={<IspitiScreen />}
          />
          <Route
            path='/SveucilistaScreen'
            element={<SveucilistaScreen />}
          />
        </Route>
      </Routes>
    </Router>
  );
}

export default App;
