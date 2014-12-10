import unittest
import dynamic_inventory
import json


class DynamicInventoryTest(unittest.TestCase):
    def testWithList(self):
        with open('expect-json-with-list.json') as expect_json:
            expect = json.load(expect_json)

        with open('test.json') as hosts:
            groups = json.load(hosts)

        groups = dynamic_inventory.withList(groups)

        self.assertEqual(json.dumps(expect, sort_keys=True), groups)
