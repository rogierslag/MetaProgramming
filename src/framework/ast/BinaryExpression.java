package framework.ast;

import java.util.Collection;
import java.util.HashSet;

/**
 * Created by Rogier on 29-09-14.
 */
public class BinaryExpression extends Expression {

	public Expression left;
	public Expression right;
	public String operator;

	public String toString() {
		return String.format("BinaryExpression(%s,%s,%s)", operator, left, right);
	}

	@Override
	public boolean containsId(ID id) {
		return left.containsId(id) || right.containsId(id);
	}

	@Override
	public Collection<Expression> getChildren() {
		Collection<Expression> res = new HashSet<>();
		res.add(left);
		res.add(right);
		res.addAll(left.getChildren());
		res.addAll(right.getChildren());
		return res;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof BinaryExpression) {
			BinaryExpression that = (BinaryExpression) obj;
			return this.operator.equals(that.operator) && this.left.equals(that.left) && this.right.equals(that.right);
		}
		return false;
	}

	@Override
	public int hashCode() {
		return operator.hashCode() + 17 * left.hashCode() + 33 * right.hashCode();
	}
}
