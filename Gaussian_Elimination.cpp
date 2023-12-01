#include <iostream>
using namespace std;
float a, b, c;

void solve(float mat[3][4], float x[3]) {
    int n = 3;

    for (int i = 0; i < n; i++) {
        for (int j = i + 1; j < n; j++) {
            float f = mat[j][i] / mat[i][i];
            for (int k = i; k <= n; k++) {
                mat[j][k] -= f * mat[i][k];
            }
        }
    }

    x[n - 1] = mat[n - 1][n] / mat[n - 1][n - 1];
    for (int i = n - 2; i >= 0; i--) {
        x[i] = mat[i][n];
        for (int j = i + 1; j < n; j++) {
            x[i] -= mat[i][j] * x[j];
        }
        x[i] /= mat[i][i];
    }
}

void finding_abc(float t[3], float v[3], float& a, float& b, float& c) {
    float mat[3][4] = {{t[0] * t[0], t[0], 1, v[0]},
                       {t[1] * t[1], t[1], 1, v[1]},
                       {t[2] * t[2], t[2], 1, v[2]}};

    float x[3];
    solve(mat, x);

    a = x[0];
    b = x[1];
    c = x[2];
}

void calculation(int t){
    cout<<"V("<<t<<") = "<<a*t*t+b*t+c;
}

int main() {
    float t[3] = {5, 8, 12};
    float v[3] = {106.8, 177.2, 279.2};

    finding_abc(t, v, a, b, c);

    cout << "a = " << a << endl;
    cout << "b = " << b << endl;
    cout << "c = " << c << endl;

    calculation(6);

    return 0;
}
