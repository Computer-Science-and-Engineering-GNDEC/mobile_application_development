// Home.js
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const Home = ({ route }) => {
  const { name } = route.params;

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Welcome, {name}!</Text>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
  title: {
    fontSize: 20,
  },
});

export default Home;
