const express = require('express');
const graphqlHTTP = require('express-graphql').graphqlHTTP;

const typeDefs = require('./graphql/types');
const resolvers = require('./graphql/resolvers');

const { makeExecutableSchema } = require('@graphql-tools/schema');

const schema = makeExecutableSchema({
    typeDefs,
    resolvers,
});

const app = express();
app.use('/graphql', graphqlHTTP({
  schema,
  graphiql: true,
}));

app.listen(3000, () => {
    console.info('Listening on http://localhost:3000/graphql');
});